/**
 * User: nek
 * Date: 3/8/11
 * Time: 00:15
 */
package {
import flash.display.BitmapData;
import flash.display.Sprite;

public class Circle implements IBitmapSprite {
	private var _bitmapData:BitmapData;

	private var _x:Number = 0;
	private var _y:Number = 0;
	public var vx:Number;
	public var vy:Number;
	public var enabled:Boolean = false;


	public function Circle(size:int,color:uint) {
		_bitmapData = new BitmapData(size, size,true,0x00000000);
		drawCircle(size,color);
	}

	private function drawCircle(size:int, color:uint):void {
		var fig:Sprite = new Sprite();
		fig.graphics.beginFill(color);
		fig.graphics.drawCircle(size/2,size/2,size/2);
		fig.graphics.endFill();
		_bitmapData.draw(fig,null,null,null,null,true);
	}

	public function get currentFrame():BitmapData {
		return _bitmapData;
	}

	public function update():void {
		x += vx;
		y += vy;
	}

	public function hitTest(mouseX:Number, mouseY:Number):Boolean {
		if (!enabled) return false;
		if (mouseX < x || mouseX > x + _bitmapData.width) return false;
		if (mouseY < y || mouseY > y + _bitmapData.height) return false;
	 	return true;
	}

	public function get x():Number {
		return _x;
	}

	public function set x(value:Number):void {
		_x = value;
	}

	public function get y():Number {
		return _y;
	}

	public function set y(value:Number):void {
		_y = value;
	}

	public function get width():int {
		return _bitmapData.width;
	}

	public function get height():int {
		return _bitmapData.height;
	}
}
}
