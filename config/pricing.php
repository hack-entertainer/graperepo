<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Pricing / Credit Costs
    |--------------------------------------------------------------------------
    |
    | Centralized pricing for user actions that consume comment credits.
    | These values represent policy, not behavior.
    | Historical costs are always recorded on the ledger at time of action.
    |
    */

    'comment' => 1,

    'vote' => [
        'incident' => 3,
        // 'motion' => 1,   // future
        // 'trial'  => 6,   // future
    ],

];
