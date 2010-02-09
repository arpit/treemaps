/*
Copyright (c) 2006 Arpit Mathur

Permission is hereby granted, free of charge, to any person 
obtaining a copy of this software and associated documentation 
files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, 
publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, 
subject to the following conditions:

The above copyright notice and this permission notice shall be 
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

package com.arpitonline.treemap
{
	import flash.display.Sprite;

	public class DefaultTreeMapRenderer extends Sprite implements ITreeMapRenderer
	{
		public function DefaultTreeMapRenderer()
		{
			
		}
		

		public function draw(treeMap:TreeMap,treeRect:TreeRect):void
		{
			
			
			this.graphics.lineStyle(1,0x333333);
			this.graphics.beginFill(0xdfdfdf);
			this.graphics.drawRect(0,0, treeRect.rect.width, treeRect.rect.height);
			this.graphics.endFill();
			
		}
		
		protected var _treeMap:TreeMap;
		public function set owner(t:TreeMap):void
		{
			_treeMap = t;	
		}
		
	}
}