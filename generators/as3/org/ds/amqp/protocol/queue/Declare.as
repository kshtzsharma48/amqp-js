/**
---------------------------------------------------------------------------

Copyright (c) 2009 Dan Simpson

Auto-Generated @ Tue Jun 23 22:54:17 -0700 2009.  Do not edit this file, extend it you must.

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


package org.ds.amqp.protocol.queue
{
	import org.ds.amqp.datastructures.*;
	import org.ds.amqp.protocol.Method;
	import org.ds.amqp.transport.Buffer;
	
	public class Declare extends Method
	{

		public var ticket                  :uint = 0;
		public var queue                   :String = "";
		public var passive                 :Boolean = false;
		public var durable                 :Boolean = false;
		public var exclusive               :Boolean = false;
		public var autoDelete              :Boolean = false;
		public var nowait                  :Boolean = false;
		public var arguments               :FieldTable = new FieldTable();

		public function Declare() {
			_classId  = 50;
			_methodId = 10;
		}


		public override function writeTo(buf:Buffer):void {

			buf.writeUnsignedShort(this.ticket);
			buf.writeShortString(this.queue);
			buf.writeBit(this.passive);
			buf.writeBit(this.durable);
			buf.writeBit(this.exclusive);
			buf.writeBit(this.autoDelete);
			buf.writeBit(this.nowait);
			buf.writeTable(this.arguments);
		}
		
		public override function readFrom(buf:Buffer):void {

			this.ticket           = buf.readUnsignedShort();
			this.queue            = buf.readShortString();
			this.passive          = buf.readBit();
			this.durable          = buf.readBit();
			this.exclusive        = buf.readBit();
			this.autoDelete       = buf.readBit();
			this.nowait           = buf.readBit();
			this.arguments        = buf.readTable();
		}
	}
}