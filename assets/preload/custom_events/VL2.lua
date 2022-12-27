function onCreate()
    makeAnimatedLuaSprite('TalkNorm', 'GoinPostal/postal_dude_voice_lines_sprites', 250, 600);
    addAnimationByPrefix('TalkNorm', '1', 'Sigh', 24, false);
    addAnimationByPrefix('TalkNorm', '2', 'LeaveAMark', 24, false);
    addAnimationByPrefix('TalkNorm', '3', 'Idontthinkso', 24, false);
    setProperty('TalkNorm.visible', false);
    setProperty('TalkNorm.scale.x', 1.1);
    setProperty('TalkNorm.scale.y', 1.1);
    addLuaSprite('TalkNorm', false);

    precacheImage('GoinPostal/postal_dude_voice_lines_sprites');
end

amountOfInstances = 4;

minionTable = {
    ['x'] = {420, 420, 420; n=amountOfInstances},
    ['y'] = {610, 610, 610; n=amountOfInstances}
}

function MinionAppearance(instance)
    if not(instance >= 1 and instance <= amountOfInstances) then
        return;
    end

    if not getProperty('TalkNorm.visible') then
        setProperty('TalkNorm.visible', true);
    end
    setProperty('dad.alpha', 0)
    setProperty('TalkNorm.x', minionTable['x'][instance]);
    setProperty('TalkNorm.y', minionTable['y'][instance]);
    objectPlayAnimation('TalkNorm', tostring(instance), true);
end

function onEvent(name, value1, value2)
	if name == 'VL2' then
        MinionAppearance(tonumber(value1));
    end
end

function onUpdate(elapsed)
    if getProperty('TalkNorm.animation.curAnim.finished') == true and getProperty('TalkNorm.animation.curAnim.name') == '2' then
        setProperty('TalkNorm.visible', false);
        setProperty('dad.alpha', 1)
    end
end

