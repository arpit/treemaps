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

package com.arpitonline.geom{
	import flash.geom.Rectangle;
	public class DiffRect{
		/**
		 * Returns the difference Rectangle if the contained Rectangle 
		 * shares three sides as the container Rectangle. 
		 * 
		 */  
		public static function getDifferenceRect(containerRect:Rectangle,containedRect:Rectangle):Rectangle{
			if(containerRect.bottom != containedRect.bottom){
				return getBottomDifferenceRect(containerRect, containedRect);
			}
			else if(containerRect.left != containedRect.left){
				return getLeftDifferenceRect(containerRect, containedRect);
			}
			else if(containerRect.right != containedRect.right){
				return getRightDifferenceRect(containerRect, containedRect);
			}
			else if(containerRect.top != containedRect.top){
				return getTopDifferenceRect(containerRect, containedRect);
			}
			else return null;
		}
		
		private static function getBottomDifferenceRect(containerRect:Rectangle, containedRect:Rectangle):Rectangle{
			return new Rectangle(containerRect.x, containerRect.y+containedRect.height, containerRect.width,containerRect.height-containedRect.height);
		}
		private static function getLeftDifferenceRect(containerRect:Rectangle, containedRect:Rectangle):Rectangle{
			return new Rectangle(containerRect.x, containerRect.y,containerRect.width-containedRect.width, containerRect.height);
		}
		private static function getRightDifferenceRect(containerRect:Rectangle, containedRect:Rectangle):Rectangle{
			return new Rectangle(containerRect.x+containedRect.width, containedRect.y, containerRect.width-containedRect.width, containerRect.height);
		}
		private static function getTopDifferenceRect(containerRect:Rectangle, containedRect:Rectangle):Rectangle{
			return new Rectangle(containerRect.x, containerRect.y, containerRect.width, containerRect.height-containedRect.height);
		}
	}
}