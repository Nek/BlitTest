/**
 * User: nek
 * Date: 3/8/11
 * Time: 00:15
 */
package {
import flash.display.BitmapData;
import flash.text.TextField;

public class Letter {
	private var _bitmapData:BitmapData;

	public var x:Number = 0;
	public var y:Number = 0;
	public var vx:Number;
	public var vy:Number;

	public function Letter(c:String) {
		var letter:TextField = new TextField();
		letter.textColor = 0xFFFFFF;
		letter.text = c;
		_bitmapData = new BitmapData(20, 20,true,0xff000000);
		_bitmapData.draw(letter,null,null,null,null,true);
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
