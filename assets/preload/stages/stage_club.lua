function onCreate()
	-- background shit
	makeLuaSprite('club', 'BG_club', -1150, -470);
	setScrollFactor('club', 0.95, 0.95);
	scaleObject('club', 1.05, 1.05);

	makeLuaSprite('stage', 'clubstage', -1150, -470);
	setScrollFactor('stage', 0.95, 0.95);
	scaleObject('stage', 1.05, 1.05);

    makeAnimatedLuaSprite('nikusa', 'NikusaBG', -1100,-440);
    addAnimationByPrefix('nikusa', 'dance', 'NikusaBG idle', 12, false);
    objectPlayAnimation('nikusa', 'dance');
    setScrollFactor('nikusa', 0.9, 0.9);
	scaleObject('nikusa', 1, 1);

    makeLuaSprite('curtains', 'clubcurtains', -1150, -470);
	setScrollFactor('curtains', 0.95, 0.95);
	scaleObject('curtains', 1.05, 1.05);

    makeLuaSprite('spotlight', 'clublights_add', -1153, -470);
    setBlendMode('spotlight', 'add');
	setScrollFactor('spotlight', 0.93, 0.93);
	scaleObject('spotlight', 1.05, 1.05);

    makeLuaSprite('stagelight', 'club_stagelights', -1150, -470);
	setScrollFactor('stagelight', 0.9, 0.9);
	scaleObject('stagelight', 0.9, 0.9);

    makeAnimatedLuaSprite('junocassette', 'BGJunoCG', -1150,-470);
    addAnimationByPrefix('junocassette', 'dance', 'BGJunoCG idle', 12, false);
    objectPlayAnimation('junocassette', 'dance');
    setScrollFactor('junocassette', 0.9, 0.9);
	scaleObject('junocassette', 1, 1);

    makeAnimatedLuaSprite('sunday', 'bgSunday', -1050,-400);
    addAnimationByPrefix('sunday', 'danceRight', 'bgSunday danceRight', 12, false);
    addAnimationByPrefix('sunday', 'danceLeft', 'bgSunday danceLeft', 12, false);
    objectPlayAnimation('sunday', 'danceRight');
    setScrollFactor('sunday', 0.8, 0.8);
	scaleObject('sunday', 0.8, 0.8);

    makeAnimatedLuaSprite('picoretroace', 'bgRetroAcePico', -1250,-490);
    addAnimationByPrefix('picoretroace', 'dance', 'bgRetroAcePico idle', 12, false);
    objectPlayAnimation('picoretroace', 'dance');
    setScrollFactor('picoretroace', 0.8, 0.8);
	scaleObject('picoretroace', 1, 1);


	addLuaSprite('club', false);
    addLuaSprite('nikusa',false);
    addLuaSprite('stage', false);
    addLuaSprite('curtains', false);
    addLuaSprite('spotlight', false);
    addLuaSprite('stagelight', true);
    addLuaSprite('junocassette',true);
    addLuaSprite('sunday',true);
    addLuaSprite('picoretroace', true);

	 --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()
	-- triggered 4 times per section
    if curBeat % 1 == 0 then
        objectPlayAnimation('sunday', 'danceRight');
    end
	if curBeat % 2 == 0 then
		objectPlayAnimation('nikusa', 'dance');
        objectPlayAnimation('junocassette', 'dance');
        objectPlayAnimation('picoretroace', 'dance');
        objectPlayAnimation('sunday', 'danceLeft');
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
    if counter % 1 == 0 then
        objectPlayAnimation('sunday', 'danceRight');
    end
    if counter % 2 == 0 then
		objectPlayAnimation('nikusa', 'dance');
        objectPlayAnimation('junocassette', 'dance');
        objectPlayAnimation('picoretroace', 'dance');
        objectPlayAnimation('sunday', 'danceLeft');
	end
end