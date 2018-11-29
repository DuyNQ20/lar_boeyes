<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HocSinh extends Model
{
    protected $table = 'tbl_account';
    protected $fillable = ['acc_username', 'acc_password'];
    public $timestamps = false;
}
