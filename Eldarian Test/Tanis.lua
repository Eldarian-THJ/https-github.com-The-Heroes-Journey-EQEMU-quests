
function event_say(e)
        if(e.message:findi("hail")) then
            e.self:Say ( "Greetings " .. e.other:GetName() .. ". I am the official Historian of the Coven.  " ..
                       "You must be the ones they sent to broker an alliance with us. This will be no small task  " ..
                       "It could take you several life times.. [" .. eq.say_link("Lifetimes?",false,"Lifetimes?") .. "]."
            );
        elseif(e.message:findi("Lifetimes?")) then
            e.self:Say ( "My apologies " .. e.other:GetName() .. ". I often forget the lifetime of mortals are quick, Often those that shine the brightest often burn the fastest.  " ..
                       "These halls are filled with Eons of stories. My personal records where stolen from me. a detailed record of our history.    " ..
                       "if you were able to assist me I would be willing to mention your good work, when the council is next in session... [" .. eq.say_link("What kind of work?",false," What kind of work?") .. "]."
			);
		elseif(e.message:findi("What kind of work?")) then
            e.self:Say ( "I would need all my documents recovered " .. e.other:GetName() .. ". we had some servants attempt to flee these halls.  " ..
                       "These thieves tore pages from my archives, I would like all four of this fragmented page returned to me.    " ..
                       "do this and we can discuss more... ."
			);
		elseif(e.message:findi("bloodline?")) then
            e.self:Say ( "Blood memories " .. e.other:GetName() .. ". we will need some form of blood memories.  " ..
                       "We need to acquire this from our current stock only from there can we derive at a pure source.    " ..
                       "Seek out a pure bloods blood vial, and return it undamaged... ."
			);
end
		
		


function event_trade(e)
	local item_lib = require("items");
		if(item_lib.check_turn_in(e.trade, {item1 = 148257 , item2 = 148257 , item3 = 148257 , item4 = 148257})) then
			e.self:Emote( "Tanis Looks over the cryptic pages as he turns his attention back to you. . .");
			e.self:Say( "How very interesting I had no idea. This is indeed  a scandalous affair. Take this Codex, it will aid you in your next several tasks. Your next task is to Find 8 pages of lost lore, of each Vampire Coven. This will assist us with cataloging our history, they should scattered among the castle  ");
			e.other:SummonItem(84050); -- Tanis notebook
		elseif(item_lib.check_turn_in(e.trade, {item1 = 148266 })) then  -- unorganized vampire lore
			e.self:Emote( " reassembles the pages into a coherent time-line . . .");
			e.self:Say("What a mid-evil mess here let me organize this for you. Amazing that you were able to get all this information from the Lycans, Curious as to why they had this information. It is no matter. Next we need the Journals of-what were their names, no matter find them and use my notebook with both. One should be around here somewhere, The other was sent to our ambassador in mistmoore.  ");
			e.other:SummonItem(148267 ); -- Chapter I: The Covens
		elseif(item_lib.check_turn_in(e.trade, {item1 = 148269 })) then  -- unorganized history of elders
			e.self:Say( "Tanis saids 'What a clear piece of History, This tells of the origins of our Elders, Viktor, Amerlia and oh my this is impossible. This cant be true at all. Viktor will need to be informed at once. In the mean time. The next pieces we will need it a lost page, combine that with some Fire to give the words life again, oh yes fire it comes in many forms, the most common would be  a vial of firewater, use my notebook then return to me.");
			e.other:SummonItem(148270); -- Chapter II: The Elders	
		elseif(item_lib.check_turn_in(e.trade, {item1 =148271})) then  -- unorganized text
			e.other:SummonItem(148272); -- Chapter III: Amelia	
            e.self:Say(" My word " .. e.other:GetName() .. ". This tales of the exploits of Amelia and how she domesticated our Lycan slaves  .  " ..
                       "A bargain was made between one of their original pack leaders, in exchange for freedom and a  life of privilege he would be free from  this struggle    " ..
                       "He surrendered his blood line in exchange ... [" .. eq.say_link("bloodline?") .. "].");
		elseif(item_lib.check_turn_in(e.trade, {item1 = 148273})) then  -- bloodvial
			e.self:Say( "they aren't pure lycans, they are mutants How in genius, take this Text and place it in my Codex. I also feel the time has come for you to be introduced to Amelia. You will find her elsewhere in the castle. Treat her with the highest respect and honor or risk your death. ");
			e.other:SummonItem(148274); -- Chapter IV: Lycan Blood Lines	
end
	item_lib.return_items(e.self, e.other, e.trade);
end
end