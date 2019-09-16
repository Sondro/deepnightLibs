import dn.*;
class Test {
	public static function main() {
		test(Bresenham, Bresenham.iterateDisc.bind(0,0,5, function(x,y) {}));
		test(CdbHelper, function() @:privateAccess dn.CdbHelper.idxToPt(0,0) );
		test(Cinematic, function() @:privateAccess Cinematic.error.bind("test") );
		test(Color, Color.intToHex.bind(0xff0000));
		test(Cooldown, function() Cooldown.INDEXES);
		test(DecisionHelper, function() new DecisionHelper([1,2,3]));
		test(Delayer, function() new Delayer(60));
		test(M, M.imax.bind(1,2));
		test(GameFocusHelper, function() {});
		test(HaxeJson, function() HaxeJson.prettify("{ a:5 }"));
		test(dn.heaps.HParticle, function() dn.heaps.HParticle.DEFAULT_BOUNDS);
		test(Lib, function() Lib.angularDistanceRad(0,3.14));
		test(PathFinder, function() new PathFinder(5,5));
		test(Process, function() new dn.Process());
		test(Rand, function() new Rand(0));
		test(RandList, function() new RandList([1,2,3]));
		test(Sfx, function() @:privateAccess Sfx.GLOBAL_GROUPS);
		test(Tweenie, function() @:privateAccess Tweenie.DEFAULT_DURATION);

		test(dn.heaps.slib.SpriteLib, function() dn.heaps.slib.SpriteLib.TMOD);


		// Unit tests
		var cd = new dn.Cooldown(60);
		trace(cd.hasSetS("test",1));
		trace(cd.hasSetS("test",1));

		var d = new Delayer(60);
		d.addS(function() trace("ok"), 0);
		d.update(1);

		var rseed = new Rand(0);
		trace(rseed.rand());
		var rseed = new Rand(0);
		trace(rseed.rand());

		var rlist = new RandList([1,2,3]);
		trace(rlist.draw());
		trace(rlist.draw());
		trace(rlist.draw());
	}

	static function test(c:Class<Dynamic>, cb:Void->Void) {
		try {
			haxe.Log.trace(Type.getClassName(c)+"...");
			cb();
		}
		catch(e:Dynamic) {
			haxe.Log.trace(" > FAILED: "+e);
			haxe.Log.trace("");
		}
	}
}