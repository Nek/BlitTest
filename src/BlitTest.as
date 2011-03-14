package {
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
		manager = new SpriteManager();

	    var spritesCount:uint = SPRITES_TOTAL;
		var sprite:Circle;
	    while (spritesCount) {
		    sprite = createRandomCircle();
		    manager.add(sprite);
		    spritesCount--;
	    }

		var renderer:SpriteRenderer = new SpriteRenderer(WIDTH, HEIGHT);
		addChild(renderer);
		manager.renderer = renderer;

	    fps = new FPSCounter();
	    addChild(fps);
		fps.x += 50;
		fps.y += 50;

//		var box:Sprite = new Sprite();
//		box.graphics.beginFill(0xFFFFFF);
//		box.graphics.drawRect(400,400,400,400);
//		box.graphics.endFill();

//		addChild(box);

		addEventListener(Event.ENTER_FRAME, update);
    }

	private function createRandomCircle():Circle {
		var sprite:Circle = new Circle(15 * (Math.random() + .1) + 1, Math.random() * 0xffffff);
		sprite.enabled = true;
		sprite.x = Math.random() * 1240 - 20;
		sprite.y = Math.random() * 840 - 20;
		sprite.vx = Math.random() * 3;
		sprite.vy = Math.random() * 3;
		return sprite;
	}

	private function update(event:Event):void {

		fps.update();
		manager.update();
	}
}
}
