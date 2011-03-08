package {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;

[SWF(width='1200',height='800',frameRate='120',backgroundColor='#000000')]
public class BlitTest extends Sprite {
	private var figures:Vector.<Figure> = new Vector.<Figure>();
	private var bitmapData:BitmapData;
    public function BlitTest() {
	    var c:uint = 4000;
	    var l:Figure;
	    while (c) {
		    l = new Figure(Figure.CIRCLE,15*(Math.random()+.1)+1,Math.random()*0xffffff);
			l.x = Math.random()*1240-20;
			l.y = Math.random()*840-20;
		    l.vx = Math.random()*3;
		    l.vy = Math.random()*3;
			figures.push(l);
		    c--;
	    }
	    addEventListener(Event.ENTER_FRAME, updateAndRender);
	    bitmapData = new BitmapData(1200,800,false,0x000000);
	    var bitmap:Bitmap = new Bitmap(bitmapData);
		addChildAt(bitmap,0);
    }

	private function updateAndRender(event:Event):void {
		bitmapData.fillRect(bitmapData.rect, 0x000000);
		var c:uint = 4000;
		var fig:Figure;
	    while (c) {
		    fig = figures[c-1];
		    fig.move();
			if (fig.y > 820) fig.y = -20;
			if (fig.x > 1220) fig.x = -20;
			bitmapData.copyPixels(fig.bitmapData,fig.bitmapData.rect,new Point(fig.x,fig.y),fig.bitmapData,new Point(0,0),true);
		    c--;
	    }
	}
}
}
