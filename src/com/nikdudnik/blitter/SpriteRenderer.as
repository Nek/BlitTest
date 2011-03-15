/**
 * User: nek
 * Date: 3/12/11
 * Time: 03:06
 */
package com.nikdudnik.blitter{
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.geom.Point;

public class SpriteRenderer extends Sprite {

	private var screenBuffer:BitmapData;
	private var screen:Bitmap;

	public function SpriteRenderer(width:int, height:int) {
		screenBuffer = new BitmapData(width, height,false,0x000000);
	    screen = new Bitmap(screenBuffer);
		addChildAt(screen,0);
	}

	public function clear():void {
		screenBuffer.fillRect(screenBuffer.rect, 0x000000);
	}

	public function draw(sprite:IBitmapSprite):void {
		screenBuffer.copyPixels(sprite.currentFrame,sprite.currentFrame.rect,new Point(sprite.x,sprite.y),sprite.currentFrame,new Point(0,0),true);
	}
}
}
