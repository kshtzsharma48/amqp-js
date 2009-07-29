/**
---------------------------------------------------------------------------

Copyright (c) 2009 Dan Simpson

Auto-Generated @ Tue Jul 28 23:54:30 -0700 2009.  Do not edit this file, extend it you must.

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

      The Tx class allows publish and ack operations to be batched into atomic
      units of work.  The intention is that all publish and ack requests issued
      within a transaction will complete successfully or none of them will.
      Servers SHOULD implement atomic transactions at least where all publish
      or ack requests affect a single queue.  Transactions that cover multiple
      queues may be non-atomic, given that queues can be created and destroyed
      asynchronously, and such events do not form part of any transaction.
      Further, the behaviour of transactions with respect to the immediate and
      mandatory flags on Basic.Publish methods is not defined.
     
      tx                  = C:SELECT S:SELECT-OK
                          / C:COMMIT S:COMMIT-OK
                          / C:ROLLBACK S:ROLLBACK-OK
    
*/
package org.ds.amqp.protocol.headers
{
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import org.ds.amqp.datastructures.*;
	import org.ds.amqp.transport.Buffer;
	import org.ds.amqp.protocol.Header;
	
	public dynamic class Tx extends Header
	{


		public function Tx() {
			_classId  = 90;
		}

		public override function writeProperties(buf:Buffer):void {

		}

		public override function readProperties(buf:Buffer):void {

		}
		
		public override function print():void {
			printObj("TxHeader", this);
		}
	}
}