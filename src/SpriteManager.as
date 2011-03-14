/**
 * User: nek
 * Date: 3/12/11
 * Time: 03:25
 */
package {
public class SpriteManager {
	private var sprites:Vector.<IBitmapSprite>;
	private var _maxWidth:int = 0;
	private var _maxHeight:int = 0;

	private var _renderer:SpriteRenderer;
	private var minX:int;
	private var minY:int;
	private var maxX:int;
	private var maxY:int;

	public function SpriteManager() {
		sprites = new Vector.<IBitmapSprite>();
	}

	public function add(sprite:IBitmapSprite):void {
		sprites.push(sprite);
		_maxWidth = Math.max(_maxWidth, sprite.width);
		_maxHeight = Math.max(_maxHeight, sprite.height);
	}

	public function set renderer(renderer:SpriteRenderer):void {
		_renderer = renderer;
		minX = -_maxWidth;
		minY = -_maxHeight;
		maxX = renderer.width + _maxWidth;
		maxY = renderer.height + _maxHeight;
	}

	public function update():void {
		_renderer.clear();
		var spritesCount:uint = sprites.length;
		var sprite:IBitmapSprite;
		var spritesUnderMouse:Vector.<IBitmapSprite> = new Vector.<IBitmapSprite>();
	    while (spritesCount) {
		    sprite = sprites[spritesCount-1];
		    spritesCount--;
		    sprite.update();
		    if (sprite.hitTest(_renderer.mouseX, _renderer.mouseY)) {
			    spritesUnderMouse.push(sprite);
		    }
		    var offscreen:Boolean = false;
		    if (sprite.y > maxY) {
				sprite.y = minY;
			    offscreen = true;
			}
			if (sprite.x > maxX) {
				sprite.x = minX;
				offscreen = true;
			}
			if (!offscreen) {
				_renderer.draw(sprite);
			}
	    }
		_renderer.useHandCursor = _renderer.buttonMode = spritesUnderMouse.length > 0;
	}
}
}
