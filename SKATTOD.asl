state("Scoot Kaboom and the Tomb of Doom")
{
	int level: "UnityPlayer.dll", 0x129EBAC, 0x0, 0x84, 0x4, 0x13C, 0x8, 0xC, 0x3C;
	int menuState: "UnityPlayer.dll", 0x12A23A0, 0x4, 0x0, 0x1C, 0x1C, 0x24, 0x18, 0x120;
	float gameTime: "UnityPlayer.dll", 0x01274000, 0x44, 0xB04, 0x3DC, 0x0, 0xC, 0x2DC, 0x50;
}

start
{
	return current.level == 0 && old.menuState == 4 && current.menuState == 0;
}

split
{
	return current.level != old.level;
}

reset
{
	return current.menuState == 4;
}

gameTime
{
	return TimeSpan.FromSeconds(current.gameTime);
}

isLoading
{
	return true;
}
