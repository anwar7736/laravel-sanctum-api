<?php

namespace Modules\Student\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\Student\Entities\Student;
class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $students = Student::latest()->simplePaginate(10);
        return view('student::student.index', compact('students'));
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('student::student.create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required'],
            'email' => ['required', 'unique:students,email'],
            'phone' => ['required', 'unique:students,phone'],
        ]);

        try{
            Student::create($data);
            return redirect()->route('student.index')->with('success', 'Student has been created!');
        }
        catch(\Exception $e)
        {
            return back()->with('error', 'Something went wrong!');
        }
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        $student = Student::findOrFail($id);
        return view('student::student.show', compact('student'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        $student = Student::findOrFail($id);
        return view('student::student.edit', compact('student'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'name' => ['required'],
            'email' => ['required', 'unique:students,email,'.$id],
            'phone' => ['required', 'unique:students,phone,'.$id],
        ]);

        try{
            Student::findOrFail($id)->update($data);
            return redirect()->route('student.index')->with('success', 'Student has been upated!');
        }
        catch(\Exception $e)
        {
            return back()->with('error', 'Something went wrong!');
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        Student::destroy($id);
        return back()->with('success', 'Student has been deleted!');
    }
}
