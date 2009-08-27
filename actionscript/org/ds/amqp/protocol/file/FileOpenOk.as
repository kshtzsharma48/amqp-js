/**
---------------------------------------------------------------------------

Copyright (c) 2009 Dan Simpson

Auto-Generated @ Wed Aug 26 19:21:28 -0700 2009.  Do not edit this file, extend it you must.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

---------------------------------------------------------------------------
**/

/*
Documentation

    This method confirms that the recipient is ready to accept staged
    data.  If the message was already partially-staged at a previous
    time the recipient will report the number of octets already staged.
  
*/
package org.ds.amqp.protocol.file
{
	import flash.utils.ByteArray;
	import org.ds.amqp.datastructures.*;
	import org.ds.amqp.protocol.Method;
	import org.ds.amqp.transport.Buffer;
	
	public dynamic class FileOpenOk extends Method
	{
		public static var EVENT:String = "70/41";

		//
		public var stagedSize              :uint = 0;

		
		public function FileOpenOk() {
			_classId  = 70;
			_methodId = 41;
			
			_synchronous = true;

			_responses = [FileStage];

		}


		public override function writeArguments(buf:Buffer):void {

			buf.writeLongLong(this.stagedSize);
		}
		
		public override function readArguments(buf:Buffer):void {

			this.stagedSize       = buf.readLongLong();
		}
		
		public override function print():void {
			var props:Array = [
				"stagedSize"
			];
			printObj("FileOpenOk", props);
		}

	}
}