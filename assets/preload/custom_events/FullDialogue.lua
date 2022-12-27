function onCreate()
    makeAnimatedLuaSprite('Voicelines', 'GoinPostal/Dramatic_line', 0, 0);
    addAnimationByPrefix('Voicelines', '1', 'sign my petition dammit  instancia 1', 24, false);
    addAnimationByPrefix('Voicelines', '2', 'Signi it dammit  instancia 1', 24, false);
    addAnimationByPrefix('Voicelines', '3', 'PH', 12, false);
    setObjectCamera('Voicelines', 'hud');
    setScrollFactor('Voicelines', 0, 0);
    setProperty('Voicelines.visible', false);
    setProperty('Voicelines.scale.x', 2);
    setProperty('Voicelines.scale.y', 2);
    addLuaSprite('Voicelines', true);
    scaleObject('Voicelines', 1, 1)

    precacheImage('GoinPostal/Dramatic_Line');
end

amountOfInstances = 4;

minionTable = {
    ['x'] = {210, 320.5, 310; n=amountOfInstances},
    ['y'] = {180, 180, 220; n=amountOfInstances}
}

function MinionAppearance(instance)
    if not(instance >= 1 and instance <= amountOfInstances) then
        return;
    end

    if not getProperty('Voicelines.visible') then
        setProperty('Voicelines.visible', true);
    end
    setProperty('Voicelines.x', minionTable['x'][instance]);
    setProperty('Voicelines.y', minionTable['y'][instance]);
    objectPlayAnimation('Voicelines', tostring(instance), true);
    doTweenY('bigTweenY', 'Voicless', 320, 3, 'circOut')
end

function onEvent(name, value1, value2)
	if name == 'FullDialogue' then
        MinionAppearance(tonumber(value1));
    end
end

function onUpdate(elapsed)
    if getProperty('Voicelines.animation.curAnim.finished') then
        setProperty('Voicelines.visible', false);
    end
end