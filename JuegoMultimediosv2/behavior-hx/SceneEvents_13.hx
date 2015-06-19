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



class SceneEvents_13 extends SceneScript
{
	
public var _texto:String;

 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("texto", "_texto");
_texto = "";

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        playSoundOnChannel(getSound(146), Std.int(0));
        createRecycledActor(getActorType(144), 115, 260, Script.FRONT);
        createRecycledActor(getActorType(71), 500, 250, Script.FRONT);
        createRecycledActor(getActorType(73), 400, 260, Script.FRONT);
        runLater(1000 * 3.5, function(timeTask:TimedTask):Void {
                    Engine.engine.setGameAttribute("finalMovimiento", true);
}, null);
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        g.setFont(getFont(85));
        g.drawString("" + _texto, 50, 450);
}
});
    
/* ======================= After N seconds ======================== */
runLater(1000 * 0, function(timeTask:TimedTask):Void
{
if(wrapper.enabled)
{
        Engine.engine.setGameAttribute("VerlaHistoria", 2);
        _texto = "Gracias a su ayuda y a la de Nino y Nina";
propertyChanged("_texto", _texto);
        runLater(1000 * 3, function(timeTask:TimedTask):Void {
                    _texto = "las acciones de limpieza y de reciclaje";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 5, function(timeTask:TimedTask):Void {
                    _texto = "en contra de Basurota y sus secuaces";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 7.5, function(timeTask:TimedTask):Void {
                    _texto = "lograron hacer feliz y limpio de nuevo al planeta.";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 13, function(timeTask:TimedTask):Void {
                    switchScene(GameModel.get().scenes.get(15).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
}, null);
}
}, null);

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}