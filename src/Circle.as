/**
 * User: nek
 * Date: 3/8/11
 * Time: 00:15
 */
package {
import flash.display.BitmapData;
import flash.display.Sprite;

public class Circle {
	private var _bitmapData:BitmapData;

	public var x:Number = 0;
	public var y:Number = 0;
	public var vx:Number;
	public var vy:Number;


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


	public function get bitmapData():BitmapData {
		return _bitmapData;
	}

	public function move():void {
		x += vx;
		y += vy;
	}
}
}
