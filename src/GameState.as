package  
{
	import org.flixel.*;
	public class GameState extends FlxState
	{
		private var molecules:FlxGroup;
		private var atoms:FlxGroup;
		private var walls:Walls;
		public function GameState() 
		{
			molecules = new FlxGroup();
			atoms = new FlxGroup();
			for (var a:int = 0; a < 5; a++){
				molecules.add(new Molecule(Math.random() * 340 + 10, Math.random() * 220 + 10));
			}
			for (var b:int = 0; b < 20; b++){
				atoms.add(new Atom());
			}
			add(molecules);
			add(atoms);
			walls = new Walls();
			add(walls);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(molecules, walls);
			FlxG.collide(atoms, walls);
			FlxG.collide(molecules, molecules);
			FlxG.collide(atoms, molecules, atomMoleculeCollide);
			FlxG.collide(atoms, atoms, atomAtomCollide);
		}
		
		public function atomMoleculeCollide(a:FlxObject, b:FlxObject):void
		{
			trace("Collide!");
			var atom:Atom;
			var mole:Molecule;
			if (a is Atom) {
				trace("A is atom");
				atom = a as Atom;
				mole = b as Molecule;
			}
			else {
				trace("A is molecule");
				mole = a as Molecule;
				atom = b as Atom;
			}
			
			//get the molecule size
			if(mole.atoms < Molecule.MAXATOMS){
				var newMole:Molecule;
				newMole = new Molecule(a.x, a.y, mole.atoms+1, mole.color);
				atoms.remove(atom);
				molecules.remove(mole);
				atom.kill();
				mole.kill();
				molecules.add(newMole);
			}
		}
		public function atomAtomCollide(a:FlxObject, b:FlxObject):void
		{
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