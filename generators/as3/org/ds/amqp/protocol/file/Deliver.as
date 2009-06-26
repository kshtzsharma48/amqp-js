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


package org.ds.amqp.protocol.file
{
	import org.ds.amqp.datastructures.*;
	import org.ds.amqp.protocol.Method;
	import org.ds.amqp.transport.Buffer;
	
	public class Deliver extends Method
	{

		public var consumerTag             :String = "";
		public var deliveryTag             :Long = new Long(0,0);
		public var redelivered             :Boolean = false;
		public var exchange                :String = "";
		public var routingKey              :String = "";
		public var identifier              :String = "";

		public function Deliver() {
			_classId  = 70;
			_methodId = 80;
		}


		public override function writeTo(buf:Buffer):void {

			buf.writeShortString(this.consumerTag);
			buf.writeLong(this.deliveryTag);
			buf.writeBit(this.redelivered);
			buf.writeShortString(this.exchange);
			buf.writeShortString(this.routingKey);
			buf.writeShortString(this.identifier);
		}
		
		public override function readFrom(buf:Buffer):void {

			this.consumerTag      = buf.readShortString();
			this.deliveryTag      = buf.readLong();
			this.redelivered      = buf.readBit();
			this.exchange         = buf.readShortString();
			this.routingKey       = buf.readShortString();
			this.identifier       = buf.readShortString();
		}
	}
}