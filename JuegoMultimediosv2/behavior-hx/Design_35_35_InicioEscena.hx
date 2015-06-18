package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_35_35_InicioEscena extends SceneScript
{
	
public var _Avanzar:Bool;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Avanzar", "_Avanzar");
_Avanzar = false;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        Engine.engine.setGameAttribute("disparo", 0);
        Engine.engine.setGameAttribute("xDevolver", 100);
        Engine.engine.setGameAttribute("yDevolver", ((getSceneHeight()) - 360));
        Engine.engine.setGameAttribute("SeCreoUnaVez", 0);
    
/* ======================== When Creating ========================= */
        createRecycledActor(getActorType(138), getScreenX(), getScreenY(), Script.FRONT);
        createRecycledActor(getActorType(147), getScreenX(), getScreenY(), Script.FRONT);
        createRecycledActor(getActorType(151), getScreenX(), getScreenY(), Script.FRONT);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(Engine.engine.getGameAttribute("AvanzarClafixicador"))
{
            g.strokeSize = Std.int(5);
            g.strokeColor = Utils.getColorRGB(0,0,0);
            g.drawRoundRect(((getScreenWidth() / 2) - 200), (getScreenHeight() / 2), 350, 100, 10);
            g.fillColor = Utils.getColorRGB(153,255,51);
            g.fillRoundRect(((getScreenWidth() / 2) - 200), (getScreenHeight() / 2), 350, 100, 10);
            g.setFont(getFont(130));
            g.drawString("" + "Solo puedes avanzar si tienes ", ((getScreenWidth() / 2) - 180), ((getScreenHeight() / 2) + 10));
            g.drawString("" + "un minimo de 50 puntos", ((getScreenWidth() / 2) - 180), ((getScreenHeight() / 2) + (15 + g.font.getHeight()/Engine.SCALE)));
            runLater(1000 * 6, function(timeTask:TimedTask):Void {
                        Engine.engine.setGameAttribute("AvanzarClafixicador", false);
}, null);
}

}
});
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(Engine.engine.getGameAttribute("ShowIntruccion"))
{
            g.strokeSize = Std.int(5);
            g.strokeColor = Utils.getColorRGB(0,0,0);
            g.drawRoundRect(((getScreenWidth() / 2) - 200), (getScreenHeight() - 50), 400, 50, 10);
            g.fillColor = Utils.getColorRGB(153,255,51);
            g.fillRoundRect(((getScreenWidth() / 2) - 200), (getScreenHeight() - 50), 400, 50, 10);
            g.setFont(getFont(130));
            g.drawString("" + "Dale click sobre la imagen para continuar ", ((getScreenWidth() / 2) - 180), ((getScreenHeight() - 50) + 10));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}