<?php

/**
 * Demo report scenario definitions
 *
 * These are declarative, deterministic descriptions of real-world
 * report flows used for demos, staging verification, and migration rehearsal.
 *
 * No logic belongs in this file.
 */

return [
    [
        // Stable, human-readable identifier for idempotency
        'key' => 'demo-sexual-assault-001',

        'reporter' => [
            'name'  => 'Aiden Brooks',
            'email' => 'aiden.brooks@demo.local',
        ],

        'subject' => [
            'name'  => 'Trevor James Hollowell',
            'phone' => '+1-512-699-1432',
            'email' => 'trevor.hollowell@demo.local',
            'address' => [
                'street'  => '3901 Barton Creek Boulevard, Unit 217',
                'city'    => 'Austin',
                'state'   => 'TX',
                'zip'     => '78735',
                'country' => 'United States',
            ],
        ],

        'incident' => [
            'type'        => 'Sexual Assault',
            'description' => 'I am submitting this report because an interaction with the subject escalated into physical contact that I did not consent to. I verbally expressed discomfort and attempted to slow things down, but the subject continued despite those signals. I felt pressured to stay calm and avoid confrontation, which made it difficult to assert myself more clearly in the moment. I am documenting this to provide an accurate account of why the interaction crossed a boundary for me.',
            'evidence' => [
                'https://www.youtube.com/watch?v=ysz5S6PUM-U',
            ],
        ],

        'subject_response' => 'I want to state that I believed the interaction was mutual at the time and did not intend to cross any boundaries. I regret that I did not pause to confirm comfort more clearly before proceeding. If my actions caused harm or distress, I acknowledge that my assumptions were incorrect, even though there was no intent to make anyone feel unsafe.',

        'community_comments' => [
            'I appreciate how clearly this was written. Situations like this can be confusing in the moment, and documenting them matters.',
            'I’m not convinced this couldn’t have been a misunderstanding on both sides, but I understand why it’s important to record it.',
            'Thank you for sharing this here. Having boundaries ignored can leave a lasting impact.',
            'This sounds like a difficult experience to process. I hope having it documented helps in some way.',
        ],
    ],
];
