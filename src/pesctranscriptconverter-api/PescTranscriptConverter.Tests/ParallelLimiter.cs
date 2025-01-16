namespace PescTranscriptConverter.Tests;

// Just because we don't want to have too many Daf's created at any one time
public record DafParallelLimit : IParallelLimit
{
    public int Limit => 5;
}
