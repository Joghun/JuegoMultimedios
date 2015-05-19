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



class SceneEvents_8 extends SceneScript
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
        playSoundOnChannel(getSound(87), Std.int(0));
        createRecycledActor(getActorType(43), 115, 10, Script.FRONT);
        runLater(1000 * 3.5, function(timeTask:TimedTask):Void {
                    createRecycledActor(getActorType(77), 680, 10, Script.FRONT);
                    createRecycledActor(getActorType(75), 775, 10, Script.FRONT);
                    createRecycledActor(getActorType(79), 825, 10, Script.FRONT);
                    createRecycledActor(getActorType(81), 925, 10, Script.FRONT);
}, null);
        runLater(1000 * 15, function(timeTask:TimedTask):Void {
                    createRecycledActor(getActorType(71), 500, 10, Script.FRONT);
                    createRecycledActor(getActorType(73), 400, 10, Script.FRONT);
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
        _texto = "Se dice que una vez el planeta estuvo limpio y resplandeciente";
propertyChanged("_texto", _texto);
        runLater(1000 * 3, function(timeTask:TimedTask):Void {
                    _texto = "Pero llegaron basurota y sus secuaces a contaminarlo";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 6, function(timeTask:TimedTask):Void {
                    _texto = "Por medio de bolsas plasticas, botellas y otros desechos";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 12, function(timeTask:TimedTask):Void {
                    _texto = "Lo que provocho que el planeta estuviera triste";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 15, function(timeTask:TimedTask):Void {
                    _texto = "Pero es ahi donde llega Nino y Nina al rescate";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 18, function(timeTask:TimedTask):Void {
                    _texto = "Por medio de las siguientes actividades que con su ayuda";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 23, function(timeTask:TimedTask):Void {
                    _texto = "Haremos para evitar que el planeta siga contaminandose";
propertyChanged("_texto", _texto);
}, null);
        runLater(1000 * 27, function(timeTask:TimedTask):Void {
                    switchScene(GameModel.get().scenes.get(0).getID(), createFadeOut(0.5, Utils.getColorRGB(0,0,0)), createFadeIn(0.5, Utils.getColorRGB(0,0,0)));
}, null);
}
}, null);

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}