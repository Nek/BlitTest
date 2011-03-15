/**
 * User: nek
 * Date: 3/12/11
 * Time: 03:32
 */
package com.nikdudnik.blitter.actors{
import flash.display.BitmapData;

public interface IBitmapSprite {
	function get currentFrame():BitmapData;

	function get x():Number;

	function set x(value:Number):void;

	function get y():Number;

	function set y(value:Number):void;

	function update():void;

	function hitTest(mouseX:Number, mouseY:Number):Boolean;

	function get width():int;

	function get height():int;

	function set underMouse(underMouse:Boolean):void;

	function set topmost(topmost:Boolean):void;
}
}
