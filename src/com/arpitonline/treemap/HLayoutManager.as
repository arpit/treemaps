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
	import flash.display.Shape;
	import flash.geom.Rectangle;
	import flash.events.Event;
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	import com.arpitonline.utils.drawing.Shapes;
	import com.arpitonline.treemap.LayoutManager;
	import com.arpitonline.treemap.ITreeMapData;
	
	public class HLayoutManager extends LayoutManager{
		
		//height of the block
		private var h:Number;
		private var currW:Number=0; 
		private var currDiff:Number;
		
		/**
		 * The HLayoutManager expands horizontally as 
		 * components are added until it decides that
		 * stretching more would worsen the w/h ratio.
		 * At this point, the addChild method returns  
		 * a false
		 * */
		 
		public function HLayoutManager(h:Number){
			this.h = h;
		}
		
		
		override public function addTreeMapItem(mapItem:TreeMapItem):Boolean{
			//width added if the area was added to adjascent to current
			var area:Number = mapItem.area;
			if(area<=0)return true;
			var widAddition:Number = area/this.h;
			
			//so the new width is
			var newWid:Number = this.currW+widAddition;
			
			// height of this new block
			var newAreaHeight:Number = area/newWid;
			
			// difference between the width and heights
			var diff:Number = Math.abs(newAreaHeight-newWid);
			
			if(diff > currDiff){
				return false;
			}
			currDiff = diff;
			currW = newWid;
			var rectY:Number = 0;
			for(var i:Number=0;i<this.rects.length; i++){
				var rect:Rectangle = rects[i].rect;
				rect.height=(rect.width*rect.height)/(rect.width+widAddition);
				rect.width+=widAddition;
				rect.y = rectY;
				rectY+=rect.height;
			}
			var newRect:Rectangle = new Rectangle(0,rectY,newWid,newAreaHeight);
			
			this.rects.push(new TreeRect(newRect,mapItem));
			// temp
			//draw();
			return true;
		}
		
		
			
	}
}