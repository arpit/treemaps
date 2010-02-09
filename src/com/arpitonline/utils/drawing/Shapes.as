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

package com.arpitonline.utils.drawing{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Rectangle;

	/**
	 * Utility class for drawing basic shapes.
	 * 
	 * @author	Arpit Mathur
	 */
	public class Shapes{
		
		/**
		 * Draws a rectangle shape on any UI class that extends Shape
		 */
		public static function drawRect(gr:Graphics, 
										x:Number,
										y:Number,
										w:Number,
										h:Number,
										color:uint,
										alphaVal:Number=1):void{
			gr.beginFill(color,alphaVal);
			gr.drawRect(x,y,w,h);
			gr.endFill();				
		}
		
		/**
		 * Draws a rectangle just like drawRect but uses the Rectangle
		 * as the object for getting coordinate information.
		 */ 
		public static function drawGeomRect(gr:Graphics,
											rect:Rectangle,
											color:uint,
											alphaVal:Number=1):void{
			
			drawRect(gr,
					rect.x,rect.y,rect.width,rect.height,
					color,alphaVal);									
		}
	}
}