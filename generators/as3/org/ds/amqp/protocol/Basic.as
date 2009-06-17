/**
---------------------------------------------------------------------------

Copyright (c) 2009 Dan Simpson

Auto-Generated @ Wed Jun 17 00:50:01 -0700 2009.  Do not edit this file, extend it you must.

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
package org.ds.amqp.protocol
{
	import flash.utils.Dictionary;
	import org.ds.amqp.protocol.basic.*;
	import org.ds.amqp.transport.Buffer;

	public class Basic extends MessageClass
	{
		private static var methodMap	:Dictionary = new Dictionary();
		
		methodMap[10]	= Qos;
		methodMap[11]	= QosOk;
		methodMap[20]	= Consume;
		methodMap[21]	= ConsumeOk;
		methodMap[30]	= Cancel;
		methodMap[31]	= CancelOk;
		methodMap[40]	= Publish;
		methodMap[50]	= Return;
		methodMap[60]	= Deliver;
		methodMap[70]	= Get;
		methodMap[71]	= GetOk;
		methodMap[72]	= GetEmpty;
		methodMap[80]	= Ack;
		methodMap[90]	= Reject;
		methodMap[100]	= Recover;
		
		public static function getMethod(id:int):Method {
			return new methodMap[id]();
		}
		

		public var contentType             :String;
		public var contentEncoding         :String;
		public var headers                 :Dictionary;
		public var deliveryMode            :int;
		public var priority                :int;
		public var correlationId           :String;
		public var replyTo                 :String;
		public var expiration              :String;
		public var messageId               :String;
		public var timestamp               :Date;
		public var type                    :String;
		public var userId                  :String;
		public var appId                   :String;
		public var clusterId               :String;

		public function Basic() {
			_classId  = 60;
		}

		public override function writeTo(buf:Buffer):void {

			buf.writeShortstr(this.contentType);
			buf.writeShortstr(this.contentEncoding);
			buf.writeTable(this.headers);
			buf.writeOctet(this.deliveryMode);
			buf.writeOctet(this.priority);
			buf.writeShortstr(this.correlationId);
			buf.writeShortstr(this.replyTo);
			buf.writeShortstr(this.expiration);
			buf.writeShortstr(this.messageId);
			buf.writeTimestamp(this.timestamp);
			buf.writeShortstr(this.type);
			buf.writeShortstr(this.userId);
			buf.writeShortstr(this.appId);
			buf.writeShortstr(this.clusterId);
		}

		public override function readFrom(buf:Buffer):void {

			this.contentType      = buf.readShortstr();
			this.contentEncoding  = buf.readShortstr();
			this.headers          = buf.readTable();
			this.deliveryMode     = buf.readOctet();
			this.priority         = buf.readOctet();
			this.correlationId    = buf.readShortstr();
			this.replyTo          = buf.readShortstr();
			this.expiration       = buf.readShortstr();
			this.messageId        = buf.readShortstr();
			this.timestamp        = buf.readTimestamp();
			this.type             = buf.readShortstr();
			this.userId           = buf.readShortstr();
			this.appId            = buf.readShortstr();
			this.clusterId        = buf.readShortstr();
		}
	}
}