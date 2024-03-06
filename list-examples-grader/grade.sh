CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [ -f "ListExamples.java" ];
then
    echo "File exists"
else
    echo "File does not exist"
    exit 1
fi
cd ..

cp -r student-submission grading-area


javac ./grading-area/student-submission/*.java

if [ $? -ne 0 ];
then
    echo "compile fail"
    exit 1
else 
    echo "compile complete"
fi

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test-results.txt
    
