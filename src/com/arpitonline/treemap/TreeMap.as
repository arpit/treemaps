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

	import com.arpitonline.geom.DiffRect;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	
	public class TreeMap extends Sprite{
		
		private var _dataProvider:Array;
		private var _areas:Array;
		private var cursor:Number = 0;
		private var definingRect:Rectangle;
		private var currentLayoutManager:LayoutManager;
		private var _hLayoutManager:Class = HLayoutManager;
		private var _vLayoutManager:Class = VLayoutManager;
		
		private var backgroundColor:uint;
		
		public function TreeMap(){
			
		}
		
		public function set dataProvider(dp:Array):void{
			_dataProvider = dp;
			_dataProvider.sortOn("weight",Array.DESCENDING|Array.NUMERIC);
			processValues(this._mapWidth, this._mapHeight);
			definingRect = new Rectangle(0,0, _mapWidth,_mapHeight);
			getLayoutManager(definingRect)
		}
		
		
		private var _renderer:Class = DefaultTreeMapRenderer;
		public function set renderer(r:Class):void{
			_renderer = r;
		}
		
		public function get dataProvider():Array{
			return _dataProvider
		}
		/**
		 * Create a series of TreeMapItem objects 
		 * initialized with the area required by each
		 * object
		 */ 
		private function processValues(_width:Number,_height:Number):void{
			
			var sum:Number = 0;
			for(var a:String in _dataProvider){
				sum+=_dataProvider[a].weight;
			}
			
			this._areas = new Array();
			
			for(var i:Number=0;i<_dataProvider.length;i++){
				var treeMapItem:TreeMapItem = new TreeMapItem();
				treeMapItem.data = _dataProvider[i];
				
				//trace("wt: "+_dataProvider[i].weight);
			    treeMapItem.area = _dataProvider[i].weight*(_width*_height)/sum; 
			    _areas.push(treeMapItem);
			}
		}
		
		
		
		/**
		 * Get an instance of a Layout Manager based on the dimensions
		 * of the instance
		 */ 
		private function getLayoutManager(definingRect:Rectangle):void{
			if(definingRect.width > definingRect.height){
				this.currentLayoutManager = new _hLayoutManager(definingRect.height);
			}
			else{
				this.currentLayoutManager = new _vLayoutManager(definingRect.width);
			}
			this.currentLayoutManager.x = this.definingRect.x;
			this.currentLayoutManager.y = this.definingRect.y;
			addArea()
		}
		
		private function addArea():void{
			if(cursor==_areas.length){
				draw();
				return
			}
			
			var added:Boolean = this.currentLayoutManager.addTreeMapItem(this._areas[cursor] as TreeMapItem);
			if(added){
				cursor++;
				addArea();
			}
			else{
				draw();
				changeLayoutManager();
			}
			
		}
		
		public function draw():void{
			
			var rects:Array = currentLayoutManager.getRects();
			for each(var treeRect:TreeRect in rects){
				var renderer:DisplayObject = new _renderer() as DisplayObject;
				addChild(renderer);
				ITreeMapRenderer(renderer).draw(this, treeRect);
				renderer.x = treeRect.rect.x
				renderer.y = treeRect.rect.y;
			}
		}
		
		/**
		 * This method is called when the current layout manager declares that
		 * it has been packed to the maximum efficiency and cannot accept the
		 * next TreeMapItem. The TreeMap then looks at the remaining area and 
		 * recomputes the best layout manager for the space left.
		 */ 
		private function changeLayoutManager():void{
			var gotRect:Rectangle = currentLayoutManager.getOccupiedRect();
			var usedRect:Rectangle = new Rectangle( this.currentLayoutManager.x, 
										  this.currentLayoutManager.y,
										  gotRect.width, gotRect.height);
			usedRect = approximateRects(definingRect,usedRect);
			definingRect = DiffRect.getDifferenceRect(definingRect,usedRect);
			getLayoutManager(definingRect)	
		}
		
		/**
		 * Approximates the Rectangle coordinates to their nearest whole numbers
		 */
		private function approximateRects(def:Rectangle, used:Rectangle):Rectangle{
			if(Math.abs(def.x-used.x)<1){
				used.x = def.x;
			}
			if(Math.abs(def.y-used.y)<1){
				used.y = def.y;
			}
			if(Math.abs(def.width-used.width)<1){
				used.width = def.width;
			}
			if(Math.abs(def.height-used.height)<1){
				used.height = def.height;
			}
			return used;
		}
		
		
		private function removeAllChildren():void{
			while (numChildren > 0){
            	removeChildAt(0);
        	}
		}
		
		public function setHLayoutManager(h:Class):void{
			_hLayoutManager = h;
		}
		public function setVLayoutManager(v:Class):void{
			_vLayoutManager = v;
		}
		
		private var _mapWidth:Number;
		private var _mapHeight:Number;
		
		public function setSize(w:Number, h:Number):void{
			_mapWidth = w;
			_mapHeight = h;
		}
	}
}