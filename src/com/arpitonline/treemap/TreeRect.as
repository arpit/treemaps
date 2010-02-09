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
package com.arpitonline.treemap{
	import flash.geom.Rectangle;
	
	/**
	 * TreeRect is holds the TreeItem - Rectangle
	 * association for a particular LayoutManager
	 */ 
	public class TreeRect{
		private var _rect:Rectangle;
		private var _item:TreeMapItem;
		
		public function TreeRect(rect:Rectangle, item:TreeMapItem){
			this._rect = rect;
			this._item = item;
		}
		
		/*
		Only getters. You arent supposed to be
		able to set these except at the time of
		creation.
		*/
		public function get rect():Rectangle{
			return _rect;
		}
		public function get item():TreeMapItem{
			return _item;
		}
	}
}