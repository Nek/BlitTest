/**
 * User: nek
 * Date: 3/15/11
 * Time: 01:25
 */
package {
import flash.text.TextField;
import flash.utils.getTimer;

public class FPSCounter extends TextField {
	private var _framesTotal:int = 0;

	public function FPSCounter() {
		super();
		textColor = 0xFFFFFF;

	}

	public function update():void {
		_framesTotal ++;
		text = (_framesTotal / (getTimer()/1000)).toString();
	}
}
}
