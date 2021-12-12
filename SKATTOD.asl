state("Scoot Kaboom and the Tomb of Doom")
{
    int level: "UnityPlayer.dll", 0x129EBAC, 0x0, 0x84, 0x4, 0x13C, 0x8, 0xC, 0x3C;
    int menuState: "UnityPlayer.dll", 0x12A23A0, 0x4, 0x0, 0x1C, 0x1C, 0x24, 0x18, 0x120;
    float gameTime: "mono-2.0-bdwgc.dll", 0x003A2C40, 0x78, 0xA80, 0x28, 0x40, 0x8, 0x2EC;
}

start
{
    return current.level == 0 && old.menuState == 4 && current.menuState == 0;
}

split
{
    return current.level != old.level || current.level != 0 && current.menuState == 0;
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
