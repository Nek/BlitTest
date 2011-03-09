package {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.text.TextField;
import flash.utils.getTimer;

[SWF(width='1200',height='800',frameRate='1000',backgroundColor='#000000')]
public class BlitTest extends Sprite {
	private var sprites:Vector.<Circle> = new Vector.<Circle>();
	private var screenBuffer:BitmapData;
	private var _fps:TextField;
	private var _framesTotal:int = 0;

	private var minX:int = -15;
	private var maxX:int = 1215;
	private var minY:int = -15;
	private var maxY:int = 815;

	private static const SPRITES_TOTAL:int = 4000;

	public function BlitTest() {
	    var spritesCount:uint = SPRITES_TOTAL;
	    var sprite:Circle;
	    while (spritesCount) {
		    var d:Number = 15*(Math.random()+.1)+1;
		    minY = minX = Math.min(-d, minX);
		    maxX = Math.max(1200 + d, maxX);
		    maxY = Math.max(800 + d, maxY);
		    sprite = new Circle(d, Math.random()*0xffffff);
			sprite.x = Math.random()*1240-20;
			sprite.y = Math.random()*840-20;
		    sprite.vx = Math.random()*3;
		    sprite.vy = Math.random()*3;
			sprites.push(sprite);
		    spritesCount--;
	    }
	    screenBuffer = new BitmapData(1200,800,false,0x000000);
	    var bmp:Bitmap = new Bitmap(screenBuffer);
		addChildAt(bmp,0);
	    _fps = new TextField();
	    _fps.textColor = 0xFFFFFF;
	    addChild(_fps);
		addEventListener(Event.ENTER_FRAME, updateAndRender);
    }

	private function updateAndRender(event:Event):void {
		_framesTotal ++;
		_fps.text = (_framesTotal / (getTimer()/1000)).toString();
		screenBuffer.fillRect(screenBuffer.rect, 0x000000);
		var spritesCount:uint = SPRITES_TOTAL;
		var fig:Circle;
	    while (spritesCount) {
		    fig = sprites[spritesCount-1];
		    spritesCount--;
		    fig.move();
		    if (fig.y > maxY) {
				fig.y = minY;
			} else
			if (fig.x > maxX) {
				fig.x = minX;
			} else
			screenBuffer.copyPixels(fig.bitmapData,fig.bitmapData.rect,new Point(fig.x,fig.y),fig.bitmapData,new Point(0,0),true);
	    }
	}
}
}
