/**
 * User: nek
 * Date: 3/12/11
 * Time: 03:25
 */
package {
public class SpriteManager {
	private var sprites:Vector.<IBitmapSprite>;

	private var _renderer:SpriteRenderer;

	public function SpriteManager() {
		sprites = new Vector.<IBitmapSprite>();
	}

	public function add(sprite:IBitmapSprite):void {
		sprites.push(sprite);
	}

	public function set renderer(renderer:SpriteRenderer):void {
		_renderer = renderer;
	}

	public function update():void {
		_renderer.clear();
		var spritesCount:uint = sprites.length;
		var sprite:IBitmapSprite;
		var spritesUnderMouse:Vector.<IBitmapSprite> = new Vector.<IBitmapSprite>();

	    while (spritesCount) {
		    spritesCount--;
		    sprite = sprites[spritesCount];
		    sprite.update();

		    var offscreen:Boolean = false;

		    if (sprite.hitTest(_renderer.mouseX, _renderer.mouseY)) {
			    sprite.underMouse = true;
			    sprite.topmost = false;
			    spritesUnderMouse.push(sprite);
		    } else {
			    sprite.underMouse = false;
			    sprite.topmost = false;
			    if (sprite.y > _renderer.height) {
					sprite.y = -sprite.height;
					offscreen = true;
				}
				if (sprite.x > _renderer.width) {
					sprite.x = -sprite.width;
					offscreen = true;
				}
		    }

			if (!offscreen) {
				_renderer.draw(sprite);
			}
	    }
		if (_renderer.useHandCursor = _renderer.buttonMode = spritesUnderMouse.length > 0) {
			spritesUnderMouse[spritesUnderMouse.length - 1].topmost = true;
		}
	}
}
}
