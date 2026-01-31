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
    [
        'key' => 'demo-harassment-002',

        'reporter' => [
            'name'  => 'Evan Morales',
            'email' => 'evan.morales@demo.local',
        ],

        'subject' => [
            'name'  => 'Priya N. Khatri',
            'email' => 'priya.khatri@demo.local',
            'phone' => '+1-732-441-9086',
            'address' => [
                'street'  => '5812 Cedar Run Parkway, Unit 5C',
                'city'    => 'Edison',
                'state'   => 'NJ',
                'zip'     => '08817',
                'country' => 'United States',
            ],
        ],

        'incident' => [
            'type'        => 'Harassment',
            'description' => 'I am submitting this report to document repeated contact from the subject after I asked for communication to stop. The messages began as professional follow-ups but shifted into personal remarks and frequent check-ins that felt intrusive. I reduced my responses and eventually disengaged, yet the contact continued through different platforms. This affected my ability to focus and made me uncomfortable, which is why I am recording the situation clearly.',
            'event_date'  => '2025-11-12',
            'evidence'    => [
                'https://www.youtube.com/watch?v=K4TOrB7at0Y',
            ],
        ],

        'subject_response' =>
        'I want to clarify that I did not intend to harass or pressure anyone. I believed the communication was professional and mutually acceptable, and I failed to recognize that it had become unwelcome. Once it was made clear to me, I stopped reaching out. I regret any discomfort caused and acknowledge that my judgment should have been better.',

        'community_comments' => [
            'I’m not sure this goes beyond miscommunication, but I understand why you’d want it documented.',
            'Thanks for putting this on record. Repeated contact can add up even when each message seems minor.',
            'This sounds uncomfortable to deal with over time. Having a clear record makes sense.',
            'I appreciate how measured this report is. It helps explain why the contact felt unwelcome.',
        ],
    ],
    [
        'key' => 'demo-sexual-abuse-003',

        'reporter' => [
            'name'  => 'Lena Whitfield',
            'email' => 'lena.whitfield@demo.local',
        ],

        'subject' => [
            'name'  => 'Marcus Daniel Rowe',
            'phone' => '+1-415-778-2649',
            'email' => 'marcus.rowe@demo.local',
            'address' => [
                'street'  => '2147 Crescent Hill Avenue',
                'city'    => 'Oakland',
                'state'   => 'CA',
                'zip'     => '94602',
                'country' => 'United States',
            ],
        ],

        'incident' => [
            'type'        => 'Sexual Abuse',
            'description' => 'I am reporting a pattern of behavior involving the subject that developed gradually and became inappropriate over time. What initially felt like support and guidance slowly shifted into personal pressure and expectations that made me uncomfortable. I struggled to object clearly because the situation was framed as care and concern, and it took distance for me to recognize that boundaries had been crossed.',
            'evidence' => [
                'https://www.youtube.com/watch?v=9bZkp7q19f0',
            ],
        ],

        'subject_response' => 'I believed my actions were supportive and appropriate within the context of our relationship. I did not recognize that my involvement was creating pressure or discomfort at the time, and I regret not being more attentive to how my behavior was perceived.',

        'community_comments' => [
            'Thank you for sharing this. Situations that develop slowly can be hard to recognize.',
            'I’m not fully convinced this was intentional, but I understand why it felt uncomfortable.',
            'I appreciate how clearly this was explained.',
            'This kind of dynamic can be very confusing while it’s happening.',
        ],
    ],
    [
        'key' => 'demo-rape-004',

        'reporter' => [
            'name'  => 'Hannah Price',
            'email' => 'hannah.price@demo.local',
        ],

        'subject' => [
            'name'  => 'Michael Thomas Avery',
            'phone' => '+1-919-556-8421',
            'email' => 'michael.avery@demo.local',
            'address' => [
                'street'  => '6721 Fox Hollow Road',
                'city'    => 'Raleigh',
                'state'   => 'NC',
                'zip'     => '27615',
                'country' => 'United States',
            ],
        ],

        'incident' => [
            'type'        => 'Rape',
            'description' => 'I am filing this report because sexual activity occurred without my consent. I stated clearly that I did not want the situation to continue and attempted to disengage, but my objections were ignored. I felt frozen and unsure how to leave safely once it became clear my boundaries were not being respected.',
            'evidence' => [
                'https://www.youtube.com/watch?v=J---aiyznGQ',
            ],
        ],

        'subject_response' => 'I believed the interaction was consensual at the time and did not realize consent had been withdrawn. I acknowledge that I should have stopped and confirmed instead of relying on assumptions, and I regret that failure in judgment.',

        'community_comments' => [
            'Thank you for documenting this. What you described sounds frightening.',
            'I’m not sure we have enough information to understand both sides, but I understand why this is upsetting.',
            'I appreciate how direct and factual this report is.',
            'Reading this reinforces how important clear consent is.',
        ],
    ],
    [
        'key' => 'demo-sexual-assault-005',

        'reporter' => [
            'name'  => 'Isabella Moreno',
            'email' => 'isabella.moreno@demo.local',
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
            'description' => 'I am submitting this report because an interaction escalated into physical contact that I did not consent to. I expressed discomfort and attempted to slow things down, but the subject continued despite those signals. I felt pressured to remain calm and avoid confrontation.',
            'evidence' => [
                'https://www.youtube.com/watch?v=ysz5S6PUM-U',
            ],
        ],

        'subject_response' => 'I genuinely believed the interaction was mutual at the time. I regret not checking in more clearly and recognize that my assumptions were insufficient, even though there was no intent to cause harm.',

        'community_comments' => [
            'Thank you for sharing this. Situations like this can be very confusing.',
            'I’m not convinced this wasn’t a misunderstanding, but documenting it makes sense.',
            'I appreciate how clearly this boundary was described.',
            'This sounds like a difficult experience to process.',
        ],
    ],
    [
        'key' => 'demo-harassment-006',

        'reporter' => [
            'name'  => 'Roly Nelson',
            'email' => 'roly.nelson@demo.local',
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
            'type'        => 'Harassment',
            'description' => 'I am submitting this report to document repeated communication that continued after I reduced engagement and indicated I wanted space. The messages persisted across platforms and became disruptive and stressful.',
            'evidence' => [
                'https://www.youtube.com/watch?v=K4TOrB7at0Y',
            ],
        ],

        'subject_response' => 'I did not intend for my messages to be unwelcome and believed the communication was mutual. Once it became clear it was not, I stopped. I regret any discomfort caused.',

        'community_comments' => [
            'Repeated contact can feel invasive over time.',
            'I’m not sure this rises beyond miscommunication, but having a record seems reasonable.',
            'This sounds uncomfortable to deal with.',
            'I appreciate how clearly this was laid out.',
        ],
    ],
    [
        'key' => 'demo-sexual-abuse-007',

        'reporter' => [
            'name'  => 'Noah Feldman',
            'email' => 'noah.feldman@demo.local',
        ],

        'subject' => [
            'name'  => 'Caroline Mae Whitfield',
            'phone' => '+1-303-718-6642',
            'email' => 'caroline.whitfield@demo.local',
            'address' => [
                'street'  => '1146 Cedar Bluff Lane',
                'city'    => 'Boulder',
                'state'   => 'CO',
                'zip'     => '80302',
                'country' => 'United States',
            ],
        ],

        'incident' => [
            'type'        => 'Sexual Abuse',
            'description' => 'I am reporting a situation that developed gradually and became inappropriate over time. What felt like guidance and emotional availability shifted into pressure and expectations that made me uncomfortable and unsure how to object.',
            'evidence' => [
                'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
            ],
        ],

        'subject_response' => 'I believed my involvement was supportive and consensual and did not recognize the discomfort it caused. I regret not noticing the impact sooner and acknowledge my judgment may have been flawed.',

        'community_comments' => [
            'Thank you for documenting this. These situations can be hard to name.',
            'I’m not sure where the line was crossed, but I understand why this felt wrong.',
            'Power dynamics can make consent complicated.',
            'I’m glad there’s a record of this now.',
        ],
    ],
];
