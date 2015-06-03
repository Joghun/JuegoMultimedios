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



class Design_13_13_AccionesActor extends ActorScript
{          	
	
public var _ListaTexto1:Array<Dynamic>;

 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("ListaTexto1", "_ListaTexto1");
_ListaTexto1 = [];
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* =========================== Keyboard =========================== */
addKeyStateListener("up", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((Engine.engine.getGameAttribute("Pausado") == false))
{
            playSoundOnChannel(getSound(21), Std.int(1));
}

}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((isKeyPressed("right") || isKeyPressed("left")))
{
            loopSoundOnChannel(getSound(23), Std.int(2));
}

        if((isKeyReleased("right") || isKeyReleased("left")))
{
            stopSoundOnChannel(Std.int(2));
}

}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((Engine.engine.getGameAttribute("disparo") == 1))
{
            if((isKeyPressed("espacio") && (Engine.engine.getGameAttribute("posicionjugador") == 0)))
{
                actor.setAnimation("" + "ti");
                createRecycledActor(getActorType(37), (actor.getX() + 0), (actor.getY() + 50), Script.FRONT);
                getLastCreatedActor().applyImpulse(-1, 0, 15);
}

            if((isKeyPressed("espacio") && (Engine.engine.getGameAttribute("posicionjugador") == 1)))
{
                actor.setAnimation("" + "td");
                createRecycledActor(getActorType(37), (actor.getX() + 100), (actor.getY() + 50), Script.FRONT);
                getLastCreatedActor().applyImpulse(1, 0.2, 15);
}

}

}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(isKeyPressed("left"))
{
            Engine.engine.setGameAttribute("posicionjugador", 0);
}

        else if(isKeyPressed("right"))
{
            Engine.engine.setGameAttribute("posicionjugador", 1);
}

}
});
    
/* ======================= Member of Group ======================== */
addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
{
if(wrapper.enabled && sameAsAny(getActorGroup(4),event.otherActor.getType(),event.otherActor.getGroup()))
{
        actor.setX(Engine.engine.getGameAttribute("xDevolver"));
        actor.setY(Engine.engine.getGameAttribute("yDevolver"));
        if((Engine.engine.getGameAttribute("SeCreoUnaVez") == 1))
{
            createRecycledActor(getActorType(128), 45, ((getSceneHeight()) - 150), Script.FRONT);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}