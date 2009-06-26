/**
---------------------------------------------------------------------------

Copyright (c) 2009 Dan Simpson

Auto-Generated @ Tue Jun 23 22:54:18 -0700 2009.  Do not edit this file, extend it you must.

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


package org.ds.amqp.protocol.stream
{
	import org.ds.amqp.datastructures.*;
	import org.ds.amqp.protocol.Method;
	import org.ds.amqp.transport.Buffer;
	
	public class Consume extends Method
	{

		public var ticket                  :uint = 0;
		public var queue                   :String = "";
		public var consumerTag             :String = "";
		public var noLocal                 :Boolean = false;
		public var exclusive               :Boolean = false;
		public var nowait                  :Boolean = false;

		public function Consume() {
			_classId  = 80;
			_methodId = 20;
		}


		public override function writeTo(buf:Buffer):void {

			buf.writeUnsignedShort(this.ticket);
			buf.writeShortString(this.queue);
			buf.writeShortString(this.consumerTag);
			buf.writeBit(this.noLocal);
			buf.writeBit(this.exclusive);
			buf.writeBit(this.nowait);
		}
		
		public override function readFrom(buf:Buffer):void {

			this.ticket           = buf.readUnsignedShort();
			this.queue            = buf.readShortString();
			this.consumerTag      = buf.readShortString();
			this.noLocal          = buf.readBit();
			this.exclusive        = buf.readBit();
			this.nowait           = buf.readBit();
		}
	}
}