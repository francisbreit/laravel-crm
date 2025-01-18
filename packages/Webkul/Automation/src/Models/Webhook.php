<?php

namespace Webkul\Automation\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Webkul\Automation\Contracts\Webhook as ContractsWebhook;

class Webhook extends Model implements ContractsWebhook
{
    protected $casts = [
        'conditions'   => 'array',
        'actions'      => 'array',
        'query_params' => 'array',
        'headers'      => 'array',
        'payload'      => 'array',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'entity_type',
        'description',
        'method',
        'end_point',
        'query_params',
        'headers',
        'payload_type',
        'raw_payload_type',
        'payload',
    ];
}
