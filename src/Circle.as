/**
 * User: nek
 * Date: 3/8/11
 * Time: 00:15
 */
package {
import flash.display.BitmapData;
import flash.display.Sprite;

public class Circle {
	private var _bitmapDataOff:BitmapData;
	private var _bitmapDataOn:BitmapData;
	private var _currBitmapData:BitmapData;

	public var x:Number = 0;
	public var y:Number = 0;
	public var vx:Number;
	public var vy:Number;


	public function Circle(size:int,color:uint) {
		_bitmapDataOff = new BitmapData(size, size,true,0x00000000);
		_bitmapDataOn = new BitmapData(size, size,true,0x00000000);
		_currBitmapData = _bitmapDataOn;
		drawCircle(size,color);
	}

	private function drawCircle(size:int, color:uint):void {
		var fig:Sprite = new Sprite();
		fig.graphics.beginFill(color);
		fig.graphics.drawCircle(size/2,size/2,size/2);
		fig.graphics.endFill();
		_bitmapDataOff.draw(fig,null,null,null,null,true);
		fig.graphics.lineStyle(0,0xFF0000);
		fig.graphics.drawRect(0, 0, size-1, size-1);
		_bitmapDataOn.draw(fig,null,null,null,null,true);
	}


	public function highlight(b:Boolean):void {
		_currBitmapData = b ? _bitmapDataOn : _bitmapDataOff;
	}

	public function get bitmapData():BitmapData {
		return _currBitmapData;
	}

	public function update():void {
		x += vx;
		y += vy;
	}

	public function hitTest(mouseX:Number, mouseY:Number):Boolean {
		if (mouseX < x || mouseX > x + _bitmapDataOff.width) return false;
		if (mouseY < y || mouseY > y + _bitmapDataOff.height) return false;
	 	return true;
	}
}
}
