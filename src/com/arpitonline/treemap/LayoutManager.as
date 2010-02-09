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
	
	public class LayoutManager{
		
		protected var rects:Array;
		
		public function LayoutManager(){
			rects = new Array();
		}
		
		protected var _x:Number;
		public function set x(val:Number):void{
			_x = val;
		}
		
		public function get x():Number{
			return _x;
		}
		
		protected var _y:Number;
		public function set y(val:Number):void{
			_y = val;
		}
		
		public function get y():Number{
			return _y;
		}
		
		public function getOccupiedRect():Rectangle{
			var r:Rectangle = this.rects[0].rect;
			for(var i:Number = 1; i<rects.length;i++){
				r = r.union(rects[i].rect);
			}
			return r;
		}
		
		public function addTreeMapItem(item:TreeMapItem):Boolean{
			// overridden
			return false;
		}
		
		public function getRects():Array{
			
			for each(var treeRect:TreeRect in rects){
				
				var rect:Rectangle  = treeRect.rect;
				rect.x += this.x;
				rect.y += this.y;
			}
			
			return rects;
		}
	}
}