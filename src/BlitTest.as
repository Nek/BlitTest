package {
import com.nikdudnik.blitter.SpriteManager;

import com.nikdudnik.blitter.SpriteRenderer;

import flash.display.Sprite;
import flash.events.Event;

[SWF(width='1200',height='800',frameRate='1000',backgroundColor='#000000')]
public class BlitTest extends Sprite {

	private var fps:FPSCounter;


	private static const SPRITES_TOTAL:int = 4000;
	private static const WIDTH:int = 1200;
	private static const HEIGHT:int = 800;

	private var manager:SpriteManager;

	public function BlitTest() {
		var renderer:SpriteRenderer = new SpriteRenderer(WIDTH, HEIGHT);
		addChild(renderer);

		manager = new SpriteManager();
		manager.renderer = renderer;

		fps = new FPSCounter();
	    addChild(fps);
		fps.x += 50;
		fps.y += 50;

	    var spritesCount:uint = SPRITES_TOTAL;
		var sprite:Circle;
	    while (spritesCount) {
		    sprite = createRandomCircle();
		    manager.add(sprite);
		    spritesCount--;
	    }
		addEventListener(Event.ENTER_FRAME, update);
    }

	private function update(event:Event):void {
		fps.update();
		manager.update();
	}

	private function createRandomCircle():Circle {
		var d:Number = 15 * (Math.random() + .1) + 1;
		var sprite:Circle = new Circle(d, Math.random() * 0xffffff);
		sprite.enabled = true;
		sprite.x = Math.random() * (WIDTH + d*2) - d;
		sprite.y = Math.random() * (HEIGHT + d*2) - d;
		sprite.vx = Math.random() * 3;
		sprite.vy = Math.random() * 3;
		return sprite;
	}


}
}
