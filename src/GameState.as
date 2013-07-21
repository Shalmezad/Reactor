package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var molecules:FlxGroup;
		private var atoms:FlxGroup;
		private var walls:Walls;
		private var levelNumber:int;
		public function GameState(levelNum:int = 1) 
		{
			levelNumber = levelNum;
			GUI.level = levelNum;
			molecules = new FlxGroup();
			atoms = new FlxGroup();
			for (var a:int = 0; a < levelNumber + 4; a++){
				molecules.add(new Molecule(Math.random() * 300 + 10, Math.random() * 220 + 10, Math.random() * 4 + 2));
			}
			/*for (var b:int = 0; b < 5; b++){
				atoms.add(new Atom());
			}*/
			add(molecules);
			add(atoms);
			walls = new Walls();
			add(walls);
			add(new GUI());
		}
		
		override public function update():void
		{
			super.update();
			handleCollisions();
			handleInput();
			trace("Molecules: " + molecules.countLiving());
			trace("Atoms: " + atoms.countLiving());
			if (molecules.countLiving() <= 0 && atoms.countLiving() <= 0) {
				FlxG.switchState(new GameState(levelNumber + 1));
			}
		}
		
		public function handleCollisions():void
		{
			FlxG.collide(molecules, walls);
			FlxG.collide(atoms, walls);
			FlxG.collide(molecules, molecules);
			FlxG.overlap(atoms, molecules, atomMoleculeCollide);
			FlxG.collide(atoms, molecules);
			FlxG.collide(atoms, atoms, atomAtomCollide);
		}
		public function handleInput():void
		{
			if (FlxG.mouse.justPressed()) {
				var mPos:FlxObject;
				mPos = new FlxObject();
				mPos.width = 1;
				mPos.height = 1;
				mPos.x = FlxG.mouse.x;
				mPos.y = FlxG.mouse.y;
				FlxG.overlap(mPos, molecules, mouseClicked);
			}
		}
		
		public function mouseClicked(a:FlxObject, b:FlxObject):void
		{
			var mole:Molecule;
			if (a is Molecule) {
				mole = a as Molecule;
			}
			else {
				mole = b as Molecule;
			}
			molecules.remove(mole, true);
			mole.kill();
			GUI.energy -= GUI.CLICK_COST;
			
			//spawn atoms for each molecule.
			for (var c:int = 0; c < mole.atoms; c++) {
				var atom:Atom = new Atom();
				atom.x = mole.x;
				atom.y = mole.y;
				atom.flicker(1);
				atoms.add(atom);
			}
		}
		
		public function atomMoleculeCollide(a:FlxObject, b:FlxObject):void
		{
			//figure out which is which
			var atom:Atom;
			var mole:Molecule;
			if (a is Atom) {
				atom = a as Atom;
				mole = b as Molecule;
			}
			else {
				mole = a as Molecule;
				atom = b as Atom;
			}
			
			if(!atom.flickering){
				//See if we can increase the molecule size or not...
				if (mole.atoms < Molecule.MAXATOMS) {
					GUI.energy -= GUI.ATOM_DRAIN;
					var newMole:Molecule;
					newMole = new Molecule(a.x, a.y, mole.atoms + 1, mole.color);
					newMole.velocity.x = mole.velocity.x;
					newMole.velocity.y = mole.velocity.y;
					atoms.remove(atom, true);
					molecules.remove(mole, true);
					atom.kill();
					mole.kill();
					molecules.add(newMole);
				}
			}
		}
		public function atomAtomCollide(a:FlxObject, b:FlxObject):void
		{
			if(!a.flickering && !b.flickering){
					GUI.energy -= (GUI.ATOM_DRAIN*2);
				//remove the atoms.
				atoms.remove(a, true);
				atoms.remove(b, true);
				a.kill();
				b.kill();
				//and make a new molecule.
				var mole:Molecule = new Molecule(a.x, a.y, 2);
				molecules.add(mole);
			}
		}
	}

}