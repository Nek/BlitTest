/**
 * User: nek
 * Date: 3/8/11
 * Time: 00:15
 */
package {
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.text.TextField;

public class Figure {
	private var _bitmapData:BitmapData;

	public var x:Number = 0;
	public var y:Number = 0;
	public var vx:Number;
	public var vy:Number;

	public static const CIRCLE:String = 'circle';
	public static const BOX:String = 'box';

	public function Figure(type:String,size:int,color:uint) {

		_bitmapData = new BitmapData(size, size,true,0x00000000);
		switch (type) {
			case CIRCLE:
				drawCircle(size,color);
				break;
			case BOX:
				drawBox(size,color);
				break;
			default:
				break;
		}
	}

	private function drawBox(size:int, color:uint):void {
		var fig:Sprite = new Sprite();
		fig.graphics.beginFill(color);
		fig.graphics.drawRect(size/2,size/2,size,size);
		fig.graphics.endFill();
		_bitmapData.draw(fig,null,null,null,null,true);
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
