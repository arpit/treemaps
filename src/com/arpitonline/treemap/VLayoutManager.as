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
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.display.Graphics;
	
	import com.arpitonline.utils.drawing.Shapes;
	
	public class VLayoutManager extends LayoutManager{
		private var w:Number;
		private var currH:Number=0;
		private var currDiff:Number;
		
		public function VLayoutManager(w:Number){
			this.w = w;
			
		}
		
		override public function addTreeMapItem(mapItem:TreeMapItem):Boolean{
			var area:Number = mapItem.area;
			if(area<=0)return true;
			//height added if the area was added to adjascent to current
			var hAddition:Number = area/this.w;
			
			//so the new height is
			var newH:Number = this.currH+hAddition;
			
			// width of this new block
			var newAreaWid:Number = area/newH;
			
			// difference between the width and heights
			var diff:Number = Math.abs(newAreaWid-newH);
			
			if(diff > currDiff){
				//this block is packed to the max.
				//draw should happen here
				//dispatchEvent(new ContainerPackedEvent(area));
				return false;
			}
			//else{
				//currRatio = nRatio;
				currDiff = diff;
				currH = newH;
			//}
			var rectX:Number = 0;
			for(var i:Number=0;i<this.rects.length; i++){
				var rect:Rectangle = rects[i].rect;
				rect.width=(rect.width*rect.height)/(rect.height+hAddition);
				rect.height+=hAddition;
				
				rect.x = rectX;
				rectX+=rect.width;
			}
			var newRect:Rectangle = new Rectangle(rectX,0,newAreaWid,newH);
			this.rects.push(new TreeRect(newRect,mapItem));
			return true;
		}
	}
}