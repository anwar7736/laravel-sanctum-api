<?php
namespace Modules\Student\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Str;
class StudentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = \Modules\Student\Entities\Student::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(),
            'email' => $this->faker->unique()->safeEmail(),
            'phone' => $this->faker->unique()->phoneNumber()
        ];
    }
}

