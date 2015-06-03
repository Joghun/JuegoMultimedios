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



class SceneEvents_11 extends SceneScript
{
	
public var _posicionBasura:Float;

public var _Random:Float;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("posicionXBasura", "_posicionBasura");
_posicionBasura = 300.0;
nameMap.set("Random", "_Random");
_Random = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        for(index0 in 0...Std.int(3))
{
            _Random = asNumber(randomInt(Math.floor(1), Math.floor(3)));
propertyChanged("_Random", _Random);
            /* "1 = papel" */
            /* "2 = plastico" */
            /* "3 = vidrio" */
            if((_Random == 1))
{
                createRecycledActor(getActorType(112), _posicionBasura, 400, Script.FRONT);
                getLastCreatedActor().setAnimation("" + ("" + randomInt(Math.floor(1), Math.floor(3))));
                Engine.engine.setGameAttribute("xClasificar", (Engine.engine.getGameAttribute("xClasificar") + 1));
}

            else if((_Random == 2))
{
                createRecycledActor(getActorType(116), _posicionBasura, 400, Script.FRONT);
                getLastCreatedActor().setAnimation("" + ("" + randomInt(Math.floor(1), Math.floor(3))));
                Engine.engine.setGameAttribute("xClasificar", (Engine.engine.getGameAttribute("xClasificar") + 1));
}

            else if((_Random == 3))
{
                createRecycledActor(getActorType(114), _posicionBasura, 400, Script.FRONT);
                getLastCreatedActor().setAnimation("" + ("" + randomInt(Math.floor(1), Math.floor(6))));
                Engine.engine.setGameAttribute("xClasificar", (Engine.engine.getGameAttribute("xClasificar") + 1));
}

            _posicionBasura = asNumber((_posicionBasura + 100));
propertyChanged("_posicionBasura", _posicionBasura);
}

    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        g.setFont(getFont(85));
        g.drawString("" + "Puntos Extra:", 100, 15);
        g.drawString("" + Engine.engine.getGameAttribute("puntosExtra"), 400, 15);
        g.drawString("" + "Coloca los reciduos en su respectivo recolector", 100, 60);
}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((Engine.engine.getGameAttribute("xClasificar") == 0))
{
            runLater(1000 * 2, function(timeTask:TimedTask):Void {
                        switchScene(GameModel.get().scenes.get(12).getID(), createFadeOut(0.25, Utils.getColorRGB(0,0,0)), createFadeIn(0.25, Utils.getColorRGB(0,0,0)));
}, null);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}