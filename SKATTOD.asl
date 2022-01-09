state("Scoot Kaboom and the Tomb of Doom")
{
	int level: "UnityPlayer.dll", 0x129EBAC, 0x0, 0x84, 0x4, 0x13C, 0x8, 0xC, 0x3C;
	int menuState: "UnityPlayer.dll", 0x12A23A0, 0x4, 0x0, 0x1C, 0x1C, 0x24, 0x18, 0x120;
	float gameTime: "UnityPlayer.dll", 0x01274000, 0x44, 0xB04, 0x3DC, 0x0, 0xC, 0x2DC, 0x50;
}

init
{
	vars.lastValidGameTime = 0;
}

update
{
	if (current.gameTime != 0) {
		vars.lastValidGameTime = current.gameTime;
	}
}

start
{
	return current.level == 0 && old.menuState == 4 && current.menuState == 0;
}

split
{
	// Levels
	if (current.level > old.level) {
		return true;
	}

	// Ending split
	return current.level == 18 && current.gameTime == 0;
}

reset
{
	if (current.menuState == 4) {
		vars.lastValidGameTime = 0;
		return true;
	}
}

gameTime
{
	return TimeSpan.FromSeconds(vars.lastValidGameTime);
}

isLoading
{
	return true;
}
