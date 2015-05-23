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



class Design_55_55_MovimientoNube extends ActorScript
{          	
	
public var _orientacion:Float;

public var _direccion:Float;

public var _xInicial:Float;

public var _yInicial:Float;

public var _distancia:Float;

 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("orientacion", "_orientacion");
_orientacion = 0.0;
nameMap.set("direccion", "_direccion");
_direccion = 0.0;
nameMap.set("xInicial", "_xInicial");
_xInicial = 0.0;
nameMap.set("yInicial", "_yInicial");
_yInicial = 0.0;
nameMap.set("distancia", "_distancia");
_distancia = 200.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _xInicial = asNumber(actor.getX());
propertyChanged("_xInicial", _xInicial);
        _yInicial = asNumber(actor.getY());
propertyChanged("_yInicial", _yInicial);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((_orientacion == 0))
{
            /* "orientacion horizontal = 0" */
            if((_direccion == 0))
{
                /* "direccion inicio final = 0" */
                actor.setXVelocity(10);
}

            else if((_direccion == 1))
{
                /* "direccion final inicio = 1" */
                actor.setXVelocity(-10);
}

}

        else if((_orientacion == 1))
{
            /* "orientacion vertical  = 1" */
            if((_direccion == 0))
{
                actor.setYVelocity(10);
}

            else if((_direccion == 1))
{
                actor.setYVelocity(-10);
}

}

}
});
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if((_orientacion == 0))
{
            if((actor.getX() < _xInicial))
{
                _direccion = asNumber(0);
propertyChanged("_direccion", _direccion);
}

            else if((actor.getX() > (_xInicial + _distancia)))
{
                _direccion = asNumber(1);
propertyChanged("_direccion", _direccion);
}

}

        else if((_orientacion == 1))
{
            if((actor.getY() < (_yInicial - _distancia)))
{
                _direccion = asNumber(0);
propertyChanged("_direccion", _direccion);
}

            else if((actor.getY() > _yInicial))
{
                _direccion = asNumber(1);
propertyChanged("_direccion", _direccion);
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}