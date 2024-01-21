<?php
namespace App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;

trait ModelActionCauser
{
    public function __construct()
    {
        $causer_id = Auth::id() ?? 1;
        static::creating(function ($model) use($causer_id){
                $tableName = $model->getTable();
                $createdByColumnExists = Schema::hasColumn($tableName, 'created_by');
                if ($createdByColumnExists) 
                {
                    $model->created_by = $causer_id;
                }
            
        });

        static::updating(function ($model) use($causer_id){
                $tableName = $model->getTable();
                $updatedByColumnExists = Schema::hasColumn($tableName, 'updated_by');
                if ($updatedByColumnExists) 
                {
                    $model->updated_by = $causer_id;
                }
            
        });
    }
}
