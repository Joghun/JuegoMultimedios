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



class Design_72_72_DialogBox extends SceneScript
{
	
public var _BoxText:Int;

public var _AnchoStroke:Float;

public var _ColorFondo:Int;

public var _SideOffX:Float;

public var _PosicionY:Float;

public var _RadioDeEsquina:Float;

public var _AnchoCuadro:Float;

public var _SideOffHeigth:Float;

public var _TemporalAncho:Float;

public var _TemporalLargo:Float;

public var _DialogOpen:Bool;

public var _ListaTexto1:Array<Dynamic>;

public var _MostrarTexto:Bool;

public var _ContadorLista:Float;
    
/* ========================= Custom Event ========================= */
public function _customEvent_OpenDialogBox():Void
{
        _TemporalAncho += ((getScreenWidth() - (_SideOffX * 2)) / 60);
propertyChanged("_TemporalAncho", _TemporalAncho);
        _TemporalLargo += ((_AnchoCuadro - _SideOffHeigth) / 60);
propertyChanged("_TemporalLargo", _TemporalLargo);
        if((_TemporalAncho >= (getScreenWidth() - (_SideOffX * 2))))
{
            _TemporalAncho = asNumber((getScreenWidth() - (_SideOffX * 2)));
propertyChanged("_TemporalAncho", _TemporalAncho);
            _TemporalLargo = asNumber((_AnchoCuadro - _SideOffHeigth));
propertyChanged("_TemporalLargo", _TemporalLargo);
            _DialogOpen = true;
propertyChanged("_DialogOpen", _DialogOpen);
            _MostrarTexto = true;
propertyChanged("_MostrarTexto", _MostrarTexto);
}

        else
{
            runLater(1000 * 0.015, function(timeTask:TimedTask):Void {
                        _customEvent_OpenDialogBox();
}, null);
}

}

    
/* ========================= Custom Event ========================= */
public function _customEvent_CloseDialogBox():Void
{
        if(_MostrarTexto)
{
            _MostrarTexto = false;
propertyChanged("_MostrarTexto", _MostrarTexto);
}

        _TemporalAncho -= ((getScreenWidth() - (_SideOffX * 2)) / 60);
propertyChanged("_TemporalAncho", _TemporalAncho);
        _TemporalLargo -= ((_AnchoCuadro - _SideOffHeigth) / 60);
propertyChanged("_TemporalLargo", _TemporalLargo);
        if((_TemporalAncho <= 0))
{
            _TemporalAncho = asNumber(0);
propertyChanged("_TemporalAncho", _TemporalAncho);
            _TemporalLargo = asNumber(0);
propertyChanged("_TemporalLargo", _TemporalLargo);
            _DialogOpen = false;
propertyChanged("_DialogOpen", _DialogOpen);
}

        else
{
            runLater(1000 * 0.015, function(timeTask:TimedTask):Void {
                        _customEvent_CloseDialogBox();
}, null);
}

}


 
 	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("ColorStroke", "_BoxText");
_BoxText = Utils.getColorRGB(0,0,0);
nameMap.set("AnchoStroke", "_AnchoStroke");
_AnchoStroke = 0.0;
nameMap.set("ColorFill", "_ColorFondo");
_ColorFondo = Utils.getColorRGB(0,0,0);
nameMap.set("SideOffX", "_SideOffX");
_SideOffX = 0.0;
nameMap.set("PosicionY", "_PosicionY");
_PosicionY = 0.0;
nameMap.set("RadioDeEsquina", "_RadioDeEsquina");
_RadioDeEsquina = 0.0;
nameMap.set("LargoCuadro", "_AnchoCuadro");
_AnchoCuadro = 0.0;
nameMap.set("SideOffHeigth", "_SideOffHeigth");
_SideOffHeigth = 0.0;
nameMap.set("TemporalAncho", "_TemporalAncho");
_TemporalAncho = 0.0;
nameMap.set("TemporalLargo", "_TemporalLargo");
_TemporalLargo = 0.0;
nameMap.set("DialogOpen", "_DialogOpen");
_DialogOpen = false;
nameMap.set("ListaTexto1", "_ListaTexto1");
_ListaTexto1 = [];
nameMap.set("MostrarTexto", "_MostrarTexto");
_MostrarTexto = false;
nameMap.set("ContadorLista", "_ContadorLista");
_ContadorLista = 0.0;

	}
	
	override public function init()
	{
		    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        g.strokeSize = Std.int(_AnchoStroke);
        g.fillColor = _ColorFondo;
        g.fillRoundRect(_SideOffX, _PosicionY, _TemporalAncho, _TemporalLargo, _RadioDeEsquina);
        g.strokeColor = _BoxText;
        g.drawRoundRect(_SideOffX, _PosicionY, _TemporalAncho, _TemporalLargo, _RadioDeEsquina);
        /* Cuando el cuadro se termina de dibujar el cuadro se escribe el texto */
        if(_MostrarTexto)
{
            g.setFont(getFont(130));
            g.drawString("" + _ListaTexto1[Std.int(Engine.engine.getGameAttribute("InicioContadorLista"))], (_SideOffX + 50), (_PosicionY + (4 + g.font.getHeight()/Engine.SCALE)));
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("enter", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if(_DialogOpen)
{
            _customEvent_CloseDialogBox();
            runLater(1000 * 0.7, function(timeTask:TimedTask):Void {
                        if((Engine.engine.getGameAttribute("InicioContadorLista") < (_ListaTexto1.length - 1)))
{
                            _customEvent_OpenDialogBox();
                            Engine.engine.setGameAttribute("InicioContadorLista", (Engine.engine.getGameAttribute("InicioContadorLista") + 1));
}

}, null);
}

        /* "Aqui es donde iba el if de inicio" */
        /* "Este if se debe copiar en la colicion del jugador pero se debe cambiar el comportamiento del trigger" */
        if(Engine.engine.getGameAttribute("PrimerMensaje"))
{
            if((Engine.engine.getGameAttribute("InicioContadorLista") < (_ListaTexto1.length - 1)))
{
                _customEvent_OpenDialogBox();
                Engine.engine.setGameAttribute("PrimerMensaje", false);
                Engine.engine.setGameAttribute("InicioContadorLista", (Engine.engine.getGameAttribute("InicioContadorLista") + 1));
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}