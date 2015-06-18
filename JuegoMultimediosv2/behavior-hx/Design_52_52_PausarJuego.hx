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



class Design_52_52_PausarJuego extends SceneScript
{
	
public var _Pusado:Float;

public var _PantallaOscuraX:Float;

public var _PantallaOscuraY:Float;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Pusado", "_Pusado");
_Pusado = 0.0;
nameMap.set("PantallaOscuraX", "_PantallaOscuraX");
_PantallaOscuraX = 0.0;
nameMap.set("PantallaOscuraY", "_PantallaOscuraY");
_PantallaOscuraY = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        /* Crea un boton que permite regresar al menu principal */
        if(isKeyPressed("Pausa"))
{
            if((Engine.engine.getGameAttribute("Pausado") == false))
{
                Engine.engine.setGameAttribute("Pausado", true);
                /* "La idea es que se cree un boton cuando el jugador pausa el juego para que se devuelva al menu principal" */
                createRecycledActor(getActorType(131), (getScreenXCenter() - 50), (getScreenYCenter() - 25), Script.BACK);
                stopSoundOnChannel(Std.int(0));
                engine.pause();
}

            else if((Engine.engine.getGameAttribute("Pausado") == true))
{
                Engine.engine.setGameAttribute("Pausado", false);
                /* "una vez de pausada la pantalla eliminar el ultimo actor" */
                recycleActor(getLastCreatedActor());
                engine.unpause();
                if((getCurrentSceneName() == "PantallaDesierto"))
{
                    loopSoundOnChannel(getSound(31), Std.int(0));
}

                if((getCurrentSceneName() == "PantallaEscuela"))
{
                    loopSoundOnChannel(getSound(22), Std.int(0));
}

                if((getCurrentSceneName() == "Pantalla2Esena2"))
{
                    loopSoundOnChannel(getSound(31), Std.int(0));
}

                if((getCurrentSceneName() == "pantallaAire"))
{
                    loopSoundOnChannel(getSound(134), Std.int(0));
}

                if((getCurrentSceneName() == "PantallaBosque"))
{
                    loopSoundOnChannel(getSound(133), Std.int(0));
}

}

}

}
});
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(Engine.engine.getGameAttribute("Pausado"))
{
            g.translateToScreen();
            g.fillColor = Utils.getColorRGB(0,0,0);
            g.alpha = (50/100);
            g.fillRect(0, 0, (getSceneWidth()), (getSceneHeight()));
            g.setFont(getFont(85));
            g.drawString("" + "Pausado", ((getScreenWidth() / 2) - 50), ((getScreenHeight() / 2) - 100));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}